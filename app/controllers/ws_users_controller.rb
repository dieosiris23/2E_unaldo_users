class WsUsersController < ApplicationController
  soap_service namespace: 'urn:WashOutUser', camelize_wsdl: :lower

  soap_action "checkUser",
                :args   => { :userId => :integer },
                :return => { :userValid => :boolean, :userName => :string }

  def checkUser
      if (User.exists?(id: params[:userId]))
          @user = User.find(params[:userId])
          content = @user.name
          render :soap => { :userValid => true, :userName => content}
          else
              render :soap => { :userValid => false, :userName => ""}
          end
      end


end
