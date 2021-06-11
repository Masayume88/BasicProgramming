/* A4VQ2: Plot a chart to visualize the total number of views every day. Does the trend look good for us? */
SELECT
  "date",
  SUM(num_views) as total_views
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date"
ORDER BY
  "date";

/* ANSWER: We can observe a steady decline of total views after an upward trend in april.
Not a good development. */
