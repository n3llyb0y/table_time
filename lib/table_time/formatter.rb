module TableTime
  class Formatter
    def initialize(table)
      @table = table
    end

    def render
      puts to_s
    end

    def to_s
      table_data.map(&:join).join("\n")
    end

    private

    attr_reader :table

    def header
      [].tap do |head|
        head << ' ' * cell_width(yaxis.max)
        head << '|'
        xaxis.each_with_index do |value, x|
          width = column_width(x)
          head << render_cell(width: width, value: value)
        end
      end
    end

    def divider
      [].tap do |divider|
        divider << '-' * cell_width(yaxis.max)
        divider << '+'
        xaxis.each_with_index do |_, x|
          width = column_width(x)
          divider << ('-' * width)
        end
      end
    end

    def rows
      yaxis.each_with_index.map do |value, y|
        [].tap do |row|
          row << render_cell(width: cell_width(yaxis.max), value: value, method: :around)
          row << '|'
          xaxis.each_with_index do |_, x|
            width = column_width(x)
            row << render_cell(width: width, value: value_at(x, y))
          end
        end
      end
    end

    def table_data
      [].tap do |table|
        table << header
        table << divider
        rows.each do |row|
          table << row
        end
      end
    end

    def column_width(col, offset=1)
      (yaxis.each_with_index.map do |_, y|
        cell_width(value_at(col, y), offset)
      end << cell_width(xaxis[col], offset)).max
    end

    def cell_width(val, offset=1)
      val.to_s.length + offset
    end

    def render_cell(width:, value:, method: :before, offset: 1)
      value = value.to_s

      case method
      when :before
        ' ' * (width - value.length) + value
      when :around
        ' ' * (width - value.length - offset) + value + ' ' * offset
      else
        value
      end
    end

    def xaxis
      table.xaxis
    end

    def yaxis
      table.yaxis
    end

    def value_at(x ,y)
      table.value_at(x, y)
    end
  end
end
