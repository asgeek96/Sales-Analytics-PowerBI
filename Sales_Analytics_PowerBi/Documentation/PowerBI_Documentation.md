# Sales Analytics Power BI Project

## Power Query (M Code)

``` m
let
    Source = Csv.Document(File.Contents("sales_data.csv"),[Delimiter=",", Columns=8, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    PromoteHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangeType = Table.TransformColumnTypes(PromoteHeaders,{
        {"SaleID", Int64.Type},
        {"OrderDate", type date},
        {"Product", type text},
        {"Region", type text},
        {"Customer", type text},
        {"Quantity", Int64.Type},
        {"SalesAmount", type number},
        {"Cost", type number}
    })
in
    ChangeType
```

------------------------------------------------------------------------

## DAX Measures

``` dax
Total Sales = SUM(Sales[SalesAmount])

Total Profit = SUM(Sales[SalesAmount]) - SUM(Sales[Cost])

Profit Margin % = DIVIDE([Total Profit], [Total Sales])

YTD Sales = TOTALYTD([Total Sales], Sales[OrderDate])

Top Customers Rank = 
RANKX(ALL(Sales[Customer]), [Total Sales], , DESC)
```

------------------------------------------------------------------------

## Suggested Dashboard Pages

1.  Executive Overview (Total Sales, Profit, Margin KPIs)
2.  Region Wise Sales Analysis
3.  Product Performance
4.  Customer Ranking
5.  Monthly Sales Trend
