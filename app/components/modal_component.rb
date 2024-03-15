class ModalComponent < JumpstartComponent
  renders_one :header
  renders_one :body
  renders_one :actions

  def initialize(size: nil, card_class: nil, container_class: nil, close_button: true)
    @size, @card_class, @container_class, @close_button = size, card_class, container_class, close_button
  end

  def container_class
    return @container_class if @container_class.present?

    case @size
    when :sm
      "max-w-sm max-h-screen w-full backdrop:backdrop-blur-sm backdrop:bg-black/80"
    when :lg
      "max-w-lg max-h-screen w-full backdrop:backdrop-blur-sm backdrop:bg-black/80"
    when :fullscreen
      "m-0 h-full w-full max-h-full max-w-full backdrop:backdrop-blur-sm backdrop:bg-black/80"
    else # :md
      "max-w-md max-h-screen w-full backdrop:backdrop-blur-sm backdrop:bg-black/80"
    end
  end

  def card_class
    return @card_class if @card_class.present?

    case @size
    when :fullscreen
      "p-6 w-full h-full bg-white dark:bg-gray-900"
    else
      "p-6 bg-white rounded shadow-lg dark:bg-gray-900 dark:text-gray-200"
    end
  end

  def close_button?
    !!@close_button
  end
end
