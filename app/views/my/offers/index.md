<div class="my-offers-tab-wrapper">
  <div class="my-offers-container">
    <% if current_user.has_freelancer %>
    <div class="tab">
      <%= render "shared/tab", tab1: "Received Offers", tab2: "Sent Offers" %>
    </div>
    <div class="from-freelancer">
      <h3 class="text-center">
        <%= "You Have No Pending Offers From Freelancers" if from_users.empty? %>
      </h3>

      <% from_users.each do |offer| %>
        <%= render "shared/flip_card", offer: offer, to: offer.user, from: offer.freelancer.user, buttons: 2 %>
      <% end %>
    </div>

    <div class="to-freelancer hidden">
      <h3 class="text-center">
        <%= "You Have No Pending Offers To Freelancers" if to_freelancers.empty? %>
      </h3>
      <% to_freelancers.each do |offer| %>
      <%= render "shared/flip_card", offer: offer, to: offer.freelancer.user, from: offer.user, buttons: 1 %>
      <% end %>
    </div>
    <% else %>
    <div class="to-freelancer">
      <h3 class="text-center">
        <%= "You Have No Pending Offers To Freelancers" if to_freelancers.empty? %>
      </h3>
      <% to_freelancers.each do |offer| %>
      <%= render "shared/flip_card", offer: offer, to: offer.freelancer.user, from: offer.user, buttons: 1 %>
      <% end %>
    </div>
    <% end %>

  </div>
</div>
