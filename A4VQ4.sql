/* A4VQ4: Show the different completion and share rates for each device type in a chart.
What is your hypothesis on why there is a difference? */
SELECT
  device_type,
  ROUND(((SUM(num_completes) / SUM(num_views)) * 100)) AS completion_rate,
  ((SUM(num_shares) / SUM(num_views)) * 100) AS share_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  device_type
ORDER BY
  completion_rate DESC

/* ANSWER: The combined answers from non-visual question 3 and 4 serve as hypothesis here */
