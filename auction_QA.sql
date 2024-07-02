"Fascinating SQL Queries and Answers Pertaining to an Online Art Gallery Auction Platform."


1.⁠ ⁠⁠What are the top 5 items with the highest individual bid amounts?

SELECT i.ItemName, MAX(b.BidAmount) AS HighestBid
FROM Items i
JOIN Bids b ON i.ItemID = b.ItemID
GROUP BY i.ItemName
ORDER BY HighestBid DESC
LIMIT 5;

2.⁠ ⁠Which 7 categories have generated the most revenue?

SELECT c.CategoryName, SUM(t.FinalPrice) AS TotalRevenue
FROM Categories c
JOIN Items i ON c.CategoryID = i.CategoryID
JOIN Transactions t ON i.ItemID = t.ItemID
GROUP BY c.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 7;

3.⁠ ⁠Evaluate the categories with the highest average item ratings based on the transactions, offering insights into category-specific buyer satisfaction levels.

SELECT c.CategoryName, ROUND(AVG(r.Rating)) AS AverageCategoryRating
FROM Categories c
JOIN Items i ON c.CategoryID = i.CategoryID
JOIN Transactions t ON i.ItemID = t.ItemID
JOIN Reviews r ON r.ReviewedUserID = t.SellerID
GROUP BY c.CategoryName
ORDER BY AverageCategoryRating DESC
LIMIT 5;

4.⁠ Identify the users who have placed the highest number of bids across all auctions, and analyze their average bid amounts to understand their bidding behavior.

SELECT u.UserName, COUNT(b.BidID) AS TotalBids, ROUND(AVG(b.BidAmount)) AS AverageBidAmount
FROM Users u
JOIN Bids b ON u.UserID = b.UserID
GROUP BY u.UserName
ORDER BY TotalBids DESC
LIMIT 5;

5.⁠ ⁠Assess the distribution of payment methods utilized by buyers and determine the most preferred payment method, highlighting trends in buyer preferences.

SELECT b.PreferredPaymentMethod, COUNT(p.PaymentID) AS NumberOfPayments
FROM Buyers b
JOIN Payments p ON b.BuyerID = p.UserID
GROUP BY b.PreferredPaymentMethod
ORDER BY NumberOfPayments DESC;

6.⁠ ⁠Examine the top five most expensive items sold on the platform, detailing the sellers and buyers involved to provide context on high-value transactions.

SELECT i.ItemName, t.FinalPrice, u1.UserName AS Seller, u2.UserName AS Buyer
FROM Items i
JOIN Transactions t ON i.ItemID = t.ItemID
JOIN Users u1 ON t.SellerID = u1.UserID
JOIN Users u2 ON t.BuyerID = u2.UserID
ORDER BY t.FinalPrice DESC
LIMIT 5;

7. ⁠Identify the items that have achieved the highest bid-to-starting price ratio, providing insights into items that attracted significantly higher bids compared to their initial listing prices.

SELECT i.ItemName, i.StartingPrice, MAX(b.BidAmount) AS HighestBid, ROUND((MAX(b.BidAmount)) / i.StartingPrice) AS BidToStartRatio
FROM Items i
JOIN Bids b ON i.ItemID = b.ItemID
GROUP BY i.ItemName, i.StartingPrice
ORDER BY BidToStartRatio DESC
LIMIT 5;

8. Identify the top five sellers who have achieved the highest average final selling price for their auctioned items, providing insights into their pricing strategies.

SELECT s.StoreName, ROUND(AVG(t.FinalPrice)) AS AverageSellingPrice
FROM Sellers s
JOIN Users u ON s.SellerID = u.UserID
JOIN Transactions t ON u.UserID = t.SellerID
GROUP BY s.StoreName
ORDER BY AverageSellingPrice DESC
LIMIT 5;

9.Determine the top 5 users with the highest total bid amounts in the last month, and provide details of their highest single bid within that period.

WITH UserTotalBidsLastMonth AS (
    SELECT 
        b.UserID,
        u.UserName,
        SUM(b.BidAmount) AS TotalBidAmount,
        MAX(b.BidTime) AS LatestBidTime
    FROM 
        Bids b
    JOIN 
        Users u ON b.UserID = u.UserID
    WHERE 
        b.BidTime >= DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month'
        AND b.BidTime < DATE_TRUNC('month', CURRENT_DATE)
    GROUP BY 
        b.UserID, u.UserName
),
RankedUsers AS (
    SELECT 
        UserID, 
        UserName, 
        TotalBidAmount,
        LatestBidTime,
        RANK() OVER (ORDER BY TotalBidAmount DESC) AS Rank
    FROM 
        UserTotalBidsLastMonth
)
SELECT 
    UserID, 
    UserName, 
    TotalBidAmount,
    LatestBidTime
FROM 
    RankedUsers
WHERE 
    Rank <= 5;

10. Identify the items with the highest number of unique bidders in the last three months and provide details of the highest bid for each of these items.

SELECT 
    i.ItemID,
    i.ItemName,
    COUNT(DISTINCT b.UserID) AS UniqueBidders
FROM 
    Items i
JOIN 
    Bids b ON i.ItemID = b.ItemID
WHERE 
    b.BidTime >= (CURRENT_DATE - INTERVAL '3 MONTHS')
GROUP BY 
    i.ItemID, i.ItemName;
WITH RankedItems AS (
    SELECT 
        ItemID, 
        ItemName, 
        UniqueBidders,
        RANK() OVER (ORDER BY UniqueBidders DESC) AS Rank
    FROM 
        ItemUniqueBiddersLastThreeMonths
)
SELECT 
    ri.ItemID, 
    ri.ItemName, 
    ri.UniqueBidders, 
    b.UserID AS HighestBidderID, 
    u.UserName AS HighestBidderName, 
    b.BidAmount AS HighestBidAmount
FROM 
    RankedItems ri
JOIN 
    Bids b ON ri.ItemID = b.ItemID
JOIN 
    Users u ON b.UserID = u.UserID
WHERE 
    b.BidAmount = (SELECT MAX(b2.BidAmount) FROM Bids b2 WHERE b2.ItemID = ri.ItemID)
    AND ri.Rank <= 5
ORDER BY 
    ri.Rank;
