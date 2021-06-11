/* A4Q4: Which device type has the highest share rate? Why do you think that is? */
SELECT
  device_type,
  ((SUM(num_shares) / SUM(num_views)) * 100) AS share_rate
FROM
  public.daily_agg_quiz_metrics
GROUP BY
  device_type
ORDER BY
  share_rate DESC;

/* ANSWER: The share rate is highest on tablets according to the given data, with ~1.44% of tablet views leading to a  a share of the quiz.

An assumption to make is that the share rate is highest on tablet due to the inherent user experience design on tablets (and mobile phones)
is catered towards sharing via social media. This is in stark contrast to desktop browsing of quizzes where the button size of share options
is smaller and often gets obscured by multiple activities or tabs on the screen(s).
