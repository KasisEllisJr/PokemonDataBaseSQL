DELETE FROM Player;
DBCC CHECKIDENT ('Player', RESEED, 0);
INSERT INTO [Player] ([Player_FstName], [Player_LstName], [Player_Country]) VALUES
    ('Shohei', 'Kimura', 'Japan'),
    ('Michael', 'Kelsch', 'Germany'),
    ('Mao', 'Harada', 'Japan'),
    ('Federico', 'Camporesi', 'Italy'),
    ('Luca', 'Ceribelli', 'Italy'),
    ('Yuta', 'Ishigaki', 'Japan'),
    ('Seongjae', 'Jeong', 'Korean'),
    ('Giovanni', 'Cischke', 'American'),
    ('James', 'Evans', 'American'),
    ('Hirofumi', 'Kimura', 'Japan'),
    ('Montana', 'Mott', 'American');