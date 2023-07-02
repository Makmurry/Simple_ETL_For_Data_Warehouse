CREATE PROCEDURE summary_order_status 
	@StatusID INT
AS
BEGIN
    SELECT 
		sales.OrderID,
		cust.CustomerName,
		prod.ProductName,
		sales.Quantity,
		stat.StatusOrder
	FROM FactSalesOrder sales 
		JOIN DimCustomer cust ON sales.CustomerID = cust.CustomerID
		JOIN DimProduct prod ON sales.ProductID = prod.ProductID
		JOIN DimStatusOrder stat on sales.StatusID = stat.StatusID
	WHERE sales.StatusID = @StatusID ;
END;