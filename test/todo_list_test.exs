defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  test "create a new todo List" do
    assert TodoList.new() == %TodoList{}
  end


  test "get entries for a date" do
    todo_list = TodoList.new()
    |> TodoList.add_entry(%{date: {2013, 12, 19}, title: "Dentist"})

    assert TodoList.entries(todo_list, {2013, 12, 19}) ==  [%{date: {2013, 12, 19}, id: 1, title: "Dentist"}]
  end

  test "todo_crud" do
    list =
      TodoList.new()
      |> TodoList.add_entry(%{date: ~D[2018-01-01], title: "Dinner"})
      |> TodoList.add_entry(%{date: ~D[2018-01-02], title: "Dentist"})
      |> TodoList.add_entry(%{date: ~D[2018-01-02], title: "Meeting"})

    assert [%{date: ~D[2018-01-01], id: 1, title: "Updated"}] ==
             list
             |> TodoList.update_entry(1, fn entry -> %{entry | title: "Updated"} end)
             |> TodoList.entries(~D[2018-01-01])

    assert [] ==
             list
             |> TodoList.delete_entry(1)
             |> TodoList.entries(~D[2018-01-01])
  end
end
