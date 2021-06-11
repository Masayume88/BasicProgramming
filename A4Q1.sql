/* A4Q1: Which device type generates most views? */

SELECT
  device_type, SUM(num_views)
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  device_type
ORDER BY SUM(num_views) DESC

/* ANSWER: The device_type "desktop"rakes in most views when looking at the sum. */
