extends Node

signal tool_selected(tool: DataTypes.Tools)

var selected_tool: DataTypes.Tools = DataTypes.Tools.None

func select_tool(tool: DataTypes.Tools) -> void:
    selected_tool = tool
    tool_selected.emit(tool)