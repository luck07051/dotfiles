
let style = {
    text: white
    selected_text: purple_bold
    description_text: yellow
}

let menus = [
    # Configuration for default nushell menus
    # Note the lack of souce parameter
    {
        name: completion_menu
        only_buffer_difference: false
        marker: " | "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: $style
    }

    {
        name: history_menu
        only_buffer_difference: true
        marker: " ? "
        type: {
            layout: list
            page_size: 10
        }
        style: $style
    }

    {
        name: help_menu
        only_buffer_difference: true
        marker: " ? "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: $style
    }

    # Example of extra menus created using a nushell source
    # Use the source field to create a list of records that populates
    # the menu
    {
        name: commands_menu
        only_buffer_difference: false
        marker: " # "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: $style
        source: { |buffer, position|
            $nu.scope.commands
            | where command =~ $buffer
            | each { |it| {value: $it.command description: $it.usage} }
        }
    }

    {
        name: vars_menu
        only_buffer_difference: true
        marker: " # "
        type: {
            layout: list
            page_size: 10
        }
        style: $style
        source: { |buffer, position|
            $nu.scope.vars
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
    }

    {
        name: commands_with_description
        only_buffer_difference: true
        marker: " # "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: $style
        source: { |buffer, position|
            $nu.scope.commands
            | where command =~ $buffer
            | each { |it| {value: $it.command description: $it.usage} }
        }
    }
]
