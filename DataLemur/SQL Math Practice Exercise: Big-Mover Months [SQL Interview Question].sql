SELECT ticker, COUNT(ticker)
FROM stock_prices
WHERE (ABS((close-open)/(open)*100) > 10)
GROUP BY ticker
ORDER BY 2 DESC

/* Question

Display the stocks which had "big-mover months", and how many of those months they had. Order your results from the stocks with the most, to least, "big-mover months".

What is a big-mover month?
A "big-mover month" is when a stock closes up or down by greater than 10% compared to the price it opened at.

For example, when COVID hit and e-commerce became the new normal, Amazon stock in April 2020 had a big-mover month because the price shot up from $96.65 per share at open to $123.70 at close – a 28% increase!

| ticker | date                  | open   | close  | percent_change |
|--------|-----------------------|--------|--------|----------------|
| AMZN   | 04/01/2020 00:00:00   | 96.65  | 123.70 | 28.0           |
| NFLX   | 04/01/2022 00:00:00   | 376.80 | 190.36 | -49.5          |

Netflix stock had a big-mover month in April 2022 in the reverse direction. That month, Netflix reported that the company lost 200k subscribers in Q1, and expected to lose another two million subs in Q2. In Apr'22, Netflix stock opened that month at $376.80 per share, but closed at $190.36, representing a 49.5% loss – yikes!

stock_prices Example Input:
| date                  | ticker | open   | high   | low    | close  |
|-----------------------|--------|--------|--------|--------|--------|
| 01/31/2020 00:00:00   | GOOG   | 67.08  | 75.16  | 67.08  | 71.71  |
| 01/31/2020 00:00:00   | META   | 206.75 | 224.20 | 201.06 | 201.91 |
| 01/31/2020 00:00:00   | MSFT   | 158.78 | 174.05 | 156.51 | 170.23 |
| 01/31/2020 00:00:00   | AMZN   | 93.75  | 102.79 | 90.77  | 100.44 |
| 01/31/2020 00:00:00   | NFLX   | 326.10 | 359.85 | 321.20 | 345.09 |


Example Output:
| ticker | count |
|--------|-------|
| META   | 20    |
| AMZN   | 13    |
| GOOG   | 12    |
| NFLX   | 10    |
| AAPL   | 8     |
| MSFT   | 6     |



*/