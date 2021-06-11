/* A4Q5: Which day had the most views? */
SELECT
  DISTINCT "date",
  SUM(num_views) as total_views
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date"
ORDER BY
  total_views DESC;

/* ANSWER: April 9th, 2019 is the day with most views according to the table data. */
