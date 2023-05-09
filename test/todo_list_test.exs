defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  test "todo_server" do
    {:ok, pid} = TodoServer.start()
    TodoServer.add_entry(pid, %{date: ~D[2018-01-01], title: "Dinner"})
    TodoServer.add_entry(pid, %{date: ~D[2018-01-02], title: "Dentist"})
    TodoServer.add_entry(pid, %{date: ~D[2018-01-02], title: "Meeting"})

    assert [%{date: ~D[2018-01-01], id: 1, title: "Dinner"}] ==
             TodoServer.entries(pid, ~D[2018-01-01])
  end
end
