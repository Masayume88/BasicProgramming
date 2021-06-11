/* A4VQ3: Plot a chart to visualize the total number of views every day but for each device type.
Does this align with what you found in problem 1, question 1 & 2? */
SELECT
  "date",
  SUM(num_views) as total_views,
  device_type
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  "date",
  device_type
ORDER BY
  "date";

/* ANSWER: The total view results vary from the specific quiz view results from assignment 1, problem 1 & 2.
It's almost a reverse trend in terms of peaks and throughs when comparing num_views per day from quiz_id
2023144 (mobile) and total views per day via mobile. */
