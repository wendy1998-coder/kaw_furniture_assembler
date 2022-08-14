SELECT
    piece.id,
    box.name AS furniture_set,
    Slot.name AS slot,
    piece.name,
    CONCAT_WS(
            "",
            Slot.filepath,
            box.filenamePrefix,
            piece.filenameAddition,
            Slot.filenameSuffix
        ) AS Imagepath
FROM
    `Furniture_piece` AS piece,
    Furniture_set AS box,
    Slot
WHERE
        box.id LIKE piece.furniture_set AND piece.slot LIKE Slot.id