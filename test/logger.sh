describe "logger.sh"

  ROOT=/shpec
  . "$ROOT"/src/logger.sh ""

  describe "basic operations"
    it "asserts equality"
      foo() {
          ENTER
          DEBUG "DEBUG message"
          INFO "INFO message"
          echo "echo message"
          WARN "WARN message"
          ERROR "ERROR message"
          EXIT
      }

      ENTER

      foo

      EXIT
    end

    it "asserts inequality"
      assert unequal "foo" "bar"
    end

    it "asserts less than"
      assert lt 5 7
    end

    it "asserts greater than"
      assert gt 7 5
    end

    it "asserts presence"
      assert present "something"
    end

    it "asserts blankness"
      assert blank ""
    end
  end

  describe "equality matcher"
    it "handles newlines properly"
      string_with_newline_char="new\nline"
      multiline_string='new
line'
      assert equal "$multiline_string" "$string_with_newline_char"
    end

    it "compares strings containing single quotes"
      assert equal "a' b" "a' b"
    end

    it "compares strings containing double quotes"
      assert equal 'a" b' 'a" b'
    end
  end

  describe "lt matcher"
    it "handles numbers of different length properly"
      assert lt 5 17
    end
  end

  describe "gt matcher"
    it "handles numbers of different length properly"
      assert gt 17 5
    end
  end
end
