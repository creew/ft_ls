cmake_minimum_required(VERSION 3.14)
project(ft_ls)

set(CMAKE_C_STANDARD 99)

add_executable(ft_ls
        srcs/ft_ls.c
        srcs/parse_args.c
        srcs/read_dir.c
        srcs/sub_funcs.c
        srcs/print_entry.c
        srcs/writeout.c
        srcs/print_sub.c
        srcs/time_sub.c
        srcs/print_rights.c
        srcs/print_list.c
        srcs/callbacks.c
        srcs/write_errors.c
        srcs/write_strings.c
        srcs/get_field_lengths.c
        srcs/print_short.c
        srcs/get_vals.c
        srcs/getset_format.c
        srcs/get_lst_params.c
        srcs/print_long.c)

include_directories(./libft/includes
        ./includes)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/libft ft)
target_link_libraries(ft_ls ft)