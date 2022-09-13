SELECT
    piece.id,
    box.name AS furniture_set,
    piece.slot,
    piece.name,
    piece.google_drive_id
FROM
    Furniture_piece AS piece,
    Furniture_set AS box
WHERE
    box.id LIKE piece.furniture_set