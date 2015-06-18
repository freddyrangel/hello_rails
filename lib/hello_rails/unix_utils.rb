module HelloRails
  module UnixUtils
    def shell(command)
      %x{#{command}}
      raise "#{command} failed with status #{$?.exitstatus}." unless $?.success?
    end

    # Distinguish BSD vs GNU sed with the --version flag (only present in GNU sed).
    def sed_i
      @sed_format ||= begin
        %x{sed --version &> /dev/null}
        $?.success? ? "sed -i" : "sed -i ''"
      end
    end
  end
end
