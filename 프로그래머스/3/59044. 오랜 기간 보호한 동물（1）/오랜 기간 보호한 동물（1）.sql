WITH GET_DATA AS (
    SELECT A.NAME, A.DATETIME
    FROM ANIMAL_INS A
    WHERE NOT EXISTS (
        SELECT 1
        FROM ANIMAL_OUTS A2
        WHERE A.ANIMAL_ID = A2.ANIMAL_ID
    )
    ORDER BY A.DATETIME
)

SELECT NAME, DATETIME
FROM GET_DATA
WHERE ROWNUM <= 3;
