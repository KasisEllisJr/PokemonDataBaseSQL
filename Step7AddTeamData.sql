DELETE FROM Match;
DELETE FROM Team;
DBCC CHECKIDENT ('Team', RESEED, 0);
INSERT INTO [Team] ([Player_ID]) VALUES
    ('1'),
    ('2'),
    ('3'),
    ('4'),
    ('5'),
    ('6'),
    ('2'),
    ('7'),
    ('8'),
    ('9'),
    ('10'),
    ('11');