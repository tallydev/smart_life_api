class HealthyServicesController < ApplicationController
  respond_to :xml

  soap_service namespace: 'urn:WashOut'

  soap_action "funMain",
                args:   { cmd: :string },
                return: { funMainResult: :string },
                to: :fun_main

  def fun_main
    logger.info "params is: #{params.inspect}"
    cmd_xml = params[:cmd]

    response = HealthyService.dispatch cmd_xml
    logger.info "response is: #{response}"

    render soap: { funMainResult: response }
  end

end

