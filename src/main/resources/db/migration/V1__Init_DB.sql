create table message (
    id bigint not null,
    filename varchar(255),
    tag varchar(255),
    text varchar(2048) not null,
    user_id bigint,
    primary key (id)
) engine=InnoDB;

create table msg_generator (
    next_val bigint
) engine=InnoDB;

insert into msg_generator values (1);

create table user (
    id bigint not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(255) not null,
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
) engine=InnoDB;

create table user_generator (
    next_val bigint
) engine=InnoDB;

insert into user_generator values (1);

create table user_role (
    user_id bigint not null,
    roles varchar(255)
) engine=InnoDB;

alter table message
    add constraint message_user_fk
    foreign key (user_id) references user (id);

alter table user_role
    add constraint user_role_user_fk
    foreign key (user_id) references user (id);