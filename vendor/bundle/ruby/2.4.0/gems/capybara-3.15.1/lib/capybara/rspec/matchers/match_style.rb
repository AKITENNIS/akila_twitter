# frozen_string_literal: true

require 'capybara/rspec/matchers/base'

module Capybara
  module RSpecMatchers
    module Matchers
      class MatchStyle < WrappedElementMatcher
        def element_matches?(el)
          el.assert_matches_style(*@args)
        end

        def does_not_match?(_actual)
          raise ArgumentError, 'The match_style matcher does not support use with not_to/should_not'
        end

        def description
          'match style'
        end
      end
    end
  end
end

module Capybara
  module RSpecMatchers
    module Matchers
      ##
      # @deprecated
      class HaveStyle < MatchStyle
        def initialize(*args, &filter_block)
          warn 'HaveStyle matcher is deprecated, please use the MatchStyle matcher instead'
          super
        end
      end
    end
  end
end
