class SEntry
  attr_accessor :data, :next

  def initialize(data)
    @next = nil
    @data = data
  end

  def to_s
    "data: #{@data}; next: #{@next}"
  end
end

class SList
  def initialize(with_elements = false)
    @head = nil
    @tail = nil
    if with_elements
      1.upto 10 do |i|
        sentry = SEntry.new(i)
        self.add(sentry)
      end
    end
  end

  def add_to_start(sentry)
    sentry.next = @head if @head
    @head = sentry
    @tail = sentry unless @tail
    @tail.next = nil
  end

  def delete_from_start
    head = @head
    @head = head.next
    head.next = nil
  end

  def delete_from_end
    pre_tail = false
    entry = @head
    until pre_tail do
      unless entry.next.next
        pre_tail = true
      else
        entry = entry.next
      end
    end
    entry.next = nil
    @tail = entry
  end

  def add_to_end(entry)
    @tail.next = entry if @tail
    @tail = entry
    @head = entry unless @head
  end

  def show
    entry = @head
    show = ""
    while entry.next
      show += "#{entry.data} -> "
      entry = entry.next
    end
    show += "#{entry.data}"
    puts show
  end

  def reverse!
    head = SEntry.new(@tail.data)
    @tail = SEntry.new(@head.data)
    tail = @tail
    entry = @head
    while entry.next
      sentinel = SEntry.new(entry.next.data)
      sentinel.next = tail
      tail = sentinel
      entry = entry.next
    end
    @tail.next = nil
    @head = sentinel
    self
  end

  def reverse
    slist = SList.new
    entry = @head
    while entry.next
      slist.add_to_start(SEntry.new(entry.data))
      entry = entry.next
    end
    slist.add_to_start(SEntry.new(@tail.data))
    slist
  end

  alias :add :add_to_end
end

slist = SList.new(true)

slist.show

ns = slist.reverse

slist.show
ns.show
slist.show
slist.reverse!
slist.show

