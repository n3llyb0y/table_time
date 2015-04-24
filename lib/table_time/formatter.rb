module TableTime
  class Formatter
    def initialize(table)
      @table = table

      @y_width = cell_width yaxis.max
      @x_width = cell_width value_at(xaxis.length-1, yaxis.length-1)
    end

    def render
      puts to_s
    end

    def to_s
      table_data.map(&:join).join("\n")
    end

    private

    attr_reader :table, :y_width, :x_width

    def header
      [].tap do |head|
        head << ' ' * cell_width(yaxis.max)
        head << '|'
        xaxis.each_with_index do |value, x|
          width = cell_width(value_at(x, yaxis.length-1))
          head << render_cell(width: width, value: value)
        end
      end
    end

    def divider
      [].tap do |divider|
        divider << '-' * cell_width(yaxis.max)
        divider << '+'
        xaxis.each_with_index do |_, x|
          width = cell_width(value_at(x, yaxis.length-1))
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
            width = cell_width(value_at(x, yaxis.length-1))
            row << render_cell(width: width, value: table.value_at(x, y))
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

    def cell_width(num, offset=1)
      num.to_s.length + offset
    end

    def render_cell(width:, value:, method: :before, offset: 1)
      value = value.to_s

      case method
      when :before
        ' ' * (width - value.length) + value
      when :around
        ' ' * (width - offset - value.length) + value + ' ' * offset
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
