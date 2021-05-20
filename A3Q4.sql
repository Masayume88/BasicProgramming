SELECT
  *
FROM
  public.quiz_metadata
WHERE
  quiz_type = 'image checklist'
ORDER BY
  published DESC
LIMIT 1
