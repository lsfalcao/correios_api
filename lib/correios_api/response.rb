module CorreiosECT

  class Response < SimpleDelegator

    def initialize(code=200, json)
      super(RecursiveOpenStruct.new(json, :recurse_over_arrays => true))
      @code = code
    end

    def success?
      (200..299).include? @code.to_i
    end

    def client_error?
      (400..499).include? @code.to_i
    end

  end

end