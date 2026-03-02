defmodule RPG do
  defprotocol Edible do
    def eat(item, character)
  end

  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []

    defimpl Edible, for: LoafOfBread do
      def eat(_item, character) do
        {nil, %Character{health: character.health + 5, mana: character.mana}}
      end
    end
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10

    defimpl Edible, for: ManaPotion do
      def eat(item, character) do
        {%EmptyBottle{}, %Character{health: character.health, mana: character.mana + item.strength}}
      end
    end
  end

  defmodule Poison do
    defstruct []

    defimpl Edible, for: Poison do
      def eat(_item, character) do
        {%EmptyBottle{}, %Character{health: 0, mana: character.mana}}
      end
    end
  end
end
