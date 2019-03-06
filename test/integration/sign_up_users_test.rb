require 'test_helper'

class SignUpUsersTest < ActionDispatch::IntegrationTest
    def setup
        @user = User.new
    end
    
    test "sign up new users" do
        get signup_path
        assert_template 'users/new'
        assert_difference 'User.count', 1 do
            post users_path(@user), { user: { username: " ", email: "sample@test.com", password: "password"} }
            follow_redirect!
        end
        assert_template 'users/show'
        assert_select 'h1'
        assert_match "Welcome to Sample's page", response.body
    end
    
    # test "Invalid sign up result in failure"
    #     assert_no_difference 'User.count' do
    #         post users_path(@user)
    #     end
        
    

    
  
end

