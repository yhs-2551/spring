drop table if exists board_table;
create table board_table(
                            id bigint primary key auto_increment,
                            boardWriter varchar(50),
                            boardPassword varchar(50),
                            boardTitle varchar(50),
                            boardContents varchar(50),
                            boardCreatedTime datetime default now(),
                            boardHits int default 0,
                            fileAttached int default 0
);

drop table if exists board_file_table;
create table board_file_table(
                                 id bigint primary key auto_increment,
                                 originalFileName varchar(100),
                                 storedFileName varchar(100),
                                 boardId bigint,
                                 constraint fk_board_file foreign key(boardId) references board_table(id) on delete cascade
);

drop table if exists comment_table;
create table comment_table(
                              id bigint primary KEY auto_increment,
                              commentWriter varchar(50),
                              commentContents varchar(200),
                              boardId bigint,
                              commentCreatedTime datetime default now(),
                              constraint fk_comment_table foreign key(boardId) references board_table(id) on delete cascade
);
