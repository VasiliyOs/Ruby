require 'fox16'
include Fox
require_relative 'Student_list_controller.rb'
require_relative 'Student_list_JSON.rb'
class Student_list_view < FXMainWindow
  attr_accessor :page_now, :controller, :total_pages, :rows_on_page, :table
  def initialize(app)
    super(app, "Students", width: 1350, height: 500)
    @page_now = 1
    @rows_on_page = 20
    @controller = Student_list_controller.new(self)
    @combo_boxes = []
    @text_fields = []
    @main_frame = FXHorizontalFrame.new(self, LAYOUT_FILL_X | LAYOUT_FILL_Y)
    display_crud_buttons
    display_table_frame
    display_filtration_frame
  end

  def display_table_frame
    @table_frame = FXVerticalFrame.new(@main_frame,   LAYOUT_FIX_HEIGHT | LAYOUT_FIX_WIDTH, width: 810, height: 470)
    @table_frame.backColor = FXRGB(200,200,200)
    @table = FXTable.new(@table_frame, nil, opts: TABLE_READONLY | LAYOUT_FILL_X | LAYOUT_FILL_Y)
    @table.setTableSize(20, 6)
    @table.setRowHeaderWidth(0)
    name_fields =["ID", "Фaмилия", "Имя", "Отчество", "Гит", "Контакт"]
    name_fields.count.times do |col_number|
      @table.setColumnText(col_number, name_fields[col_number])
      @table.setColumnWidth(col_number, 132)
    end

    @table.connect(SEL_COMMAND) { check_count_selected_rows }

    button_frame = FXHorizontalFrame.new(@table_frame, LAYOUT_FILL_X)

    @button_left = FXButton.new(button_frame, "<-",  opts: BUTTON_NORMAL | LAYOUT_LEFT | LAYOUT_FIX_WIDTH, width: 100)
    @button_left.disable
    @button_left.connect(SEL_COMMAND) {page_left}

    @button_right = FXButton.new(button_frame, "->",  opts: BUTTON_NORMAL | LAYOUT_RIGHT | LAYOUT_FIX_WIDTH, width: 100)
    @button_right.connect(SEL_COMMAND) {page_right}
    @controller.refresh_data
    @label_page_number = FXLabel.new(button_frame, "#{@page_now}/#{@total_pages}", opts: LAYOUT_CENTER_X | LAYOUT_CENTER_Y )
    if @total_pages == 1
      @button_right.disable
    end
  end

  def display_filtration_frame
    @filtration_frame = FXVerticalFrame.new(@main_frame, LAYOUT_FILL_Y | LAYOUT_FILL_X, padding: 10)
    name_fields =["Фамилия и инициалы:", "Git:", "Телефон:", "Telegram:", "E-Mail:"]
    name_fields.count.times do |i|
      FXLabel.new(@filtration_frame, name_fields[i])
      text_field = FXTextField.new(@filtration_frame, 20, opts: TEXTFIELD_NORMAL | LAYOUT_FILL_X)
      @text_fields << text_field
      if i !=0
        combo_box = FXComboBox.new(@filtration_frame, 10, opts: COMBOBOX_STATIC | LAYOUT_FILL_X)
        @combo_boxes << combo_box
        combo_box.numVisible = 3
        combo_box.appendItem("Да")
        combo_box.appendItem("Нет")
        combo_box.appendItem("Не важно")
        combo_box.connect(SEL_COMMAND) { combo_box_change(i, combo_box.currentItem) }
      end
    end
    button_frame = FXHorizontalFrame.new(@filtration_frame, LAYOUT_FILL_X)

    reset_button = FXButton.new(button_frame, "Сбросить", opts: BUTTON_NORMAL)
    reset_button.connect(SEL_COMMAND) { @controller.reset_filters }
  end

  def display_crud_buttons
    @crud_button_frame = FXVerticalFrame.new(@main_frame, LAYOUT_FILL_Y | LAYOUT_FIX_WIDTH, width: 200)
    @update_table_button = FXButton.new(@crud_button_frame, "Обновить таблицу", opts: BUTTON_NORMAL | LAYOUT_FIX_WIDTH, width: 150)
    @add_button = FXButton.new(@crud_button_frame, "Добавить", opts: BUTTON_NORMAL | LAYOUT_FIX_WIDTH, width: 150)
    @update_button = FXButton.new(@crud_button_frame, "Изменить", opts: BUTTON_NORMAL | LAYOUT_FIX_WIDTH, width: 150)
    @update_button.disable
    @delete_button = FXButton.new(@crud_button_frame, "Удалить", opts: BUTTON_NORMAL | LAYOUT_FIX_WIDTH, width: 150)
    @delete_button.disable
  end

  def set_table_params(column_name, whole_entities_count)
    @total_pages = (whole_entities_count.to_f / @rows_on_page.to_f).ceil
  end

  def set_table_data(data_table)
    (0..19).each do |i|
      (0..5).each do |j|
        @table.setItem(i, j, FXTableItem.new(""))
      end
    end
    data_table.rows_count.times do |i|
      (data_table.columns_count-2).times do |j|
         @table.setItem(i, j, FXTableItem.new("#{data_table[i,j]}"))
      end
    end
  end




  def update_label_for_pages
    @label_page_number.text = "#{@page_now}/#{@total_pages}"
  end

  def disable_left_button
    @button_left.disable
  end

  def disable_right_button
    @button_right.disable
  end

  def enable_left_button
    @button_left.enable
  end

  def enable_right_button
    @button_right.enable
  end

  def disable_update_button
    @update_button.disable
  end

  def enable_update_button
    @update_button.enable
  end

  def disable_delete_button
    @delete_button.disable
  end

  def enable_delete_button
    @delete_button.enable
  end

  def page_left
    @page_now -= 1
    if @page_now == 1
      disable_left_button
    end
    enable_right_button
    @controller.refresh_data
    update_label_for_pages
  end
  def page_right
    @page_now += 1
    if @page_now == @total_pages
      disable_right_button
    end
    enable_left_button
    @controller.refresh_data
    update_label_for_pages
  end

  def check_count_selected_rows
    selected_rows_number = @table.selEndRow - @table.selStartRow + 1
    if selected_rows_number == 1
      enable_update_button
    else
      disable_update_button
    end

    if selected_rows_number >= 1
      enable_delete_button
    else
      disable_delete_button
    end
  end

  def combo_box_change(i, item)
    if item == 0
      @text_fields[i].enable
    else
      @text_fields[i].disable
      @text_fields[i].text = ""
    end
  end

  def reset_filters
    @combo_boxes.each do |combo_box|
      combo_box.setCurrentItem(0)
    end
    @text_fields.each do |text_field|
      text_field.enable
      text_field.text = ""
    end
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end
