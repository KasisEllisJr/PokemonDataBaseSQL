DBCC CHECKIDENT ('Match', RESEED, 0);
INSERT INTO [Match] ([TRNMT_ID], [Round_Placement], [Match_Team_1], [Match_Team_2], [Match_Winning_Team], [Match_Score]) VALUES
    ('WRLD_2023', 'Final Fight', '1', '2', '1', '2to0'),
    ('WRLD_2023', 'Runner Up 1', '3', '1', '1', '0to2'),
    ('WRLD_2023', 'Runner Up 2', '4', '2', '2', '0to2'),
    ('WRLD_2024', 'Final Fight', '5', '6', '5', '2to1'),
    ('WRLD_2024', 'Runner Up 1', '7', '6', '6', '0to2'),
    ('WRLD_2024', 'Runner Up 2', '8', '5', '5', '0to2'),
    ('WRLD_2025', 'Final Fight', '9', '10', '9', '2to1'),
    ('WRLD_2025', 'Runner Up 1', '11', '9', '9', '0to2'),
    ('WRLD_2025', 'Runner Up 2', '12', '10', '10', '0to2');