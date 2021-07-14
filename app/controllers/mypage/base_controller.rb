# frozen_string_literal: true

module Mypage
  class BaseController < ApplicationController
    before_action :require_login
    layout 'mypage'
  end
end
