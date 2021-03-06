defmodule Mix.Tasks.Loupe.Seed do
  use Mix.Task
  alias Loupe.{Inventory, Order, Repo, Transaction, User}

  @shortdoc "A mix task for seeding sample dev data"

  def run(_) do
    Mix.Task.run "app.start"

    Enum.each(users,
      fn(user) ->
        changeset = User.changeset(%User{}, user)
        with changeset.valid?,
        do:  Repo.insert changeset
      end
    )

    Enum.each(inventory,
      fn(item) ->
        changeset = Inventory.changeset(%Inventory{}, item)
        with changeset.valid?,
        do:  Repo.insert changeset
      end
    )

    Enum.each(orders,
      fn(item) ->
        changeset = Order.changeset(%Order{}, item)
        with changeset.valid?,
        do:  Repo.insert changeset
      end
    )

    Enum.each(transactions,
      fn(item) ->
        changeset = Transaction.changeset(%Transaction{}, item)
        with changeset.valid?,
        do:  Repo.insert changeset
      end
    )
  end

  def users do
    [
      %{
        first_name: "Clayton",
        last_name: "Gentry",
        company: "Swag Productions",
        email: "clayton@clayton.com",
        encrypted_password: "1234password"
      },
      %{
        first_name: "Ryan",
        last_name: "Madden",
        company: "OG Enterprises",
        email: "ryan@ryan.com",
        encrypted_password: "4321password"
      }
    ]
  end

  def inventory do
    [
      %{
        name: "Kent Wang pearl cufflinks",
        quantity: 4,
        group_id: "j91823",
        serial_number: "9138jllf",
        description: "A pair of very nice cufflinks by Kent Wang",
        metal: "stainless steel",
        stone: "pearl",
        carat: 17.55,
        clarity: "vvs2",
        cut: "oval",
        length: nil,
        size: nil,
        style_number: 50,
        wholesale_price: 34901,
        retail_price: 59815,
        image_url: "http://images.mulberry.com/s/mulberrygroup/QC0946_854C120_IS/square-tree-cufflinks",
        order_id: 1,
      },
      %{
        name: "Kent Wang pearl cufflinks",
        quantity: 4,
        group_id: "j91823",
        serial_number: "9138jllf",
        description: "A pair of very nice cufflinks by Kent Wang",
        metal: "stainless steel",
        stone: "pearl",
        carat: 17.55,
        clarity: "vvs2",
        cut: "oval",
        length: nil,
        size: nil,
        style_number: 50,
        wholesale_price: 34901,
        retail_price: 59815,
        image_url: "http://images.mulberry.com/s/mulberrygroup/QC0946_854C120_IS/square-tree-cufflinks",
        order_id: 1,
      },
      %{
        name: "Kent Wang pearl cufflinks",
        quantity: 4,
        group_id: "j91823",
        serial_number: "9138jllf",
        description: "A pair of very nice cufflinks by Kent Wang",
        metal: "stainless steel",
        stone: "pearl",
        carat: 17.55,
        clarity: "vvs2",
        cut: "oval",
        length: nil,
        size: nil,
        style_number: 50,
        wholesale_price: 34901,
        retail_price: 59815,
        image_url: "http://images.mulberry.com/s/mulberrygroup/QC0946_854C120_IS/square-tree-cufflinks",
        order_id: 1,
      },
    ]
  end

  def orders do
    [
      %{
        price: 193858,
        supplier_id: 1,
        date_ordered: Ecto.DateTime.cast("2014-04-17T14:00:00Z"),
        date_received: Ecto.DateTime.cast("2014-04-21T14:00:00Z")
      },
      %{
        price: 193858,
        supplier_id: 1,
        date_ordered: Ecto.DateTime.cast("2014-04-17T14:00:00Z"),
        date_received: Ecto.DateTime.cast("2014-04-21T14:00:00Z")
      }
    ]
  end

  def transactions do
    [
      %{
        price: 150981,
        notes: "These are some notes about the transaction.",
        customer_email: "johndoe@gmail.com",
      },
      %{
        price: 150981,
        notes: "These are some notes about the transaction.",
        customer_email: "johndoe@gmail.com",
      }
    ]
  end
end