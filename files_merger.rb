#Merge N sorted files into a single sorted file using the minimum memory footprint
class Merge
  def initialize(pathIn, pathOut)
    @pathIn = pathIn
    @pathOut = pathOut
    @data = {}
    @files = []
    build_data
  end

  def write_file
    out = File.new(File.join(@pathOut, "merged.txt"), "w")
    while @files.size > 1 do
      strip_file = @files[0]
      mark, strip_file_position = read_current_line strip_file
      @files.each do |file|
        line, position = read_current_line file
        if mark > line
          mark = line
          strip_file = file
          strip_file_position = position
        end
      end
      puts mark
      out << mark
      out.fsync
      out.flush
      @data[strip_file][:current_pos] = strip_file_position
      @files.delete(strip_file) if @data[strip_file][:current_pos] > @data[strip_file][:last_pos]
    end
    out << read_remaining(@files.pop)
    out.close
  end

  private
  def build_data
    @files = Dir.entries(@pathIn).select { |f| !File.directory? f }
    @files.each do |file|
      @data[file] = {:current_pos => 0, :last_pos => find_last_line_pos(file)}
    end
  end

  def find_last_line_pos(file_name)
    f = File.new(File.join(@pathIn, file_name))
    pos = -1
    until f.readchar == "\n"
      f.seek(pos, IO::SEEK_END)
      pos -= 1
    end
    pos = f.pos
    f.close
    pos
  end


  def read_current_line(from_file)
    f = File.new(File.join(@pathIn, from_file))
    f.seek(@data[from_file][:current_pos], IO::SEEK_SET)
    line = f.readline
    position = f.pos
    f.close
    [line, position]
  end

  def read_remaining(from_file)
    remaining = ""
    f = File.new(File.join(@pathIn, from_file))
    f.seek(@data[from_file][:current_pos], IO::SEEK_SET)
    remaining << f.read
    f.close
    remaining
  end

end

a = Merge.new(File.join("data", "files_merge", "in"), File.join("data", "files_merge", "out"))
a.write_file