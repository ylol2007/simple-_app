class StaticPagesController < ApplicationController
  def home
    cookies[:sessionid] = "6873F8B341263598"
    cookies[:Ticket] = "1356A55D93EEB7B5"
    cookies[:name] = {
        sessionid: '6873F8B341263598',
        ticket: '1356A55D93EEB7B5',
        expires: 1.year.from_now,
        domain: 'irdeto.showjet.ru' }
  end

  def help
  end

  def about

    cookies[:sessionid] = "6873F8B341263598"
    cookies[:Ticket] = "1356A55D93EEB7B5"
    cookies[:name] = {
        sessionid: '6873F8B341263598',
        ticket: '1356A55D93EEB7B5',
        expires: 1.year.from_now,
        domain: 'irdeto.showjet.ru'
    }
  end
end
