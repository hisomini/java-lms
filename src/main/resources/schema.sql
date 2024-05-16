create table course
(
    id         bigint generated by default as identity,
    title      varchar(255) not null,
    creator_id bigint       not null,
    created_at timestamp    not null,
    updated_at timestamp,
    primary key (id)
);

create table ns_user
(
    id         bigint generated by default as identity,
    user_id    varchar(20) not null,
    password   varchar(20) not null,
    name       varchar(20) not null,
    email      varchar(50),
    created_at timestamp   not null,
    updated_at timestamp,
    primary key (id)
);

create table question
(
    id         bigint generated by default as identity,
    created_at timestamp    not null,
    updated_at timestamp,
    contents   clob,
    deleted    boolean      not null,
    title      varchar(100) not null,
    writer_id  bigint,
    primary key (id)
);

create table answer
(
    id          bigint generated by default as identity,
    created_at  timestamp not null,
    updated_at  timestamp,
    contents    clob,
    deleted     boolean   not null,
    question_id bigint,
    writer_id   bigint,
    primary key (id)
);

create table delete_history
(
    id            bigint not null,
    content_id    bigint,
    content_type  varchar(255),
    created_date  timestamp,
    deleted_by_id bigint,
    primary key (id)
);

create table session_student
(
    id                         bigint generated by default as identity,
    user_id                    varchar(20) not null,
    session_id                 varchar(20) not null,
    enrollment_approval_status varchar(20) not null DEFAULT '승인'

);
create table session
(
    id                bigint generated by default as identity,
    user_id           varchar(255) not null,
    title             varchar(255) not null,
    course_id         varchar(20)  not null,
    start_date        date         not null,
    end_date          date         not null,
    progress_status   varchar(20)  not null,
    enrollment_status varchar(20)  not null DEFAULT '모집중',
    price_type        varchar(20)  not null,
    max_enrollment    bigint,
    fee               bigint       not null
);

create table session_image
(
    id         bigint generated by default as identity,
    session_id varchar(20) not null,
    image_type varchar(20) not null,
    size       bigint      not null,
    width      bigint      not null,
    height     bigint      not null
)



