SELECT
    piece.id,
    box.name AS furniture_set,
    Slot.name AS slot,
    piece.name,
    piece.google_drive_id,
    piece.google_drive_thumbnail_id
FROM
    `Furniture_piece` AS piece,
    Furniture_set AS box,
    Slot
WHERE
    box.id LIKE piece.furniture_set AND piece.slot LIKE Slot.id