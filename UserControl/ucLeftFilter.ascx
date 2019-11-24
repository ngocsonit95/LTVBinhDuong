<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucLeftFilter.ascx.cs" Inherits="ucLeftFilter" %>

<div id="main-filter">
    <div class="facet">
        <h5>Lọc kết quả theo kĩ năng</h5>
        <ul>
            <asp:Repeater runat="server" ID="Repeater_Skill">
                <ItemTemplate>
                    <li>
                        <div class="custom-control custom-radio" onchange='SerchToUrl("sk","<%# Eval("ID") %>")'>
                            <input type="radio" class="custom-control-input" id='checkskill<%# Eval("ID") %>' name="check"   value='<%# Eval("ID") %>''>
                            <label class="custom-control-label rd-red" for="checkskill<%# Eval("ID") %>">

                                <%# Eval("Title") %>
                            </label>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="facet">
        <h5>Lọc kết quả theo trường</h5>
        <ul>
            <asp:Repeater runat="server" ID="Repeater_School">
                <ItemTemplate>
                    <li>
                        <div class="custom-control custom-radio" onchange='SerchToUrl("sc","<%# Eval("Title") %>")'>
                            <input type="radio" class="custom-control-input" id='checkschool<%# Eval("ID") %>' name="check" <%# CheckedLeft("sc".ToSafetyString(),Eval("ID").ToInt()) %>>
                            <label class="custom-control-label rd-red" for="checkschool<%# Eval("ID") %>"><%# Eval("Title") %></label>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="facet">
        <h5>Lọc kết quả công ty</h5>
        <ul>
            <asp:Repeater runat="server" ID="Repeater_Company">
                <ItemTemplate>
                    <li>
                        <div class="custom-control custom-radio" onchange='SerchToUrl("cp","<%# Eval("ID") %>")'>
                            <input type="radio"
                                class="custom-control-input"
                                id='checkcompany<%# Eval("ID") %>'

                                name="check"
                                <%# CheckedLeft("cp".ToSafetyString(),Eval("ID").ToInt()) %>>
                            <label class="custom-control-label rd-red" for="checkcompany<%# Eval("ID") %>">
                                 <img runat="server" class="img-radio" src='<%# AvatarCompany(Eval("Avatar").ToSafetyString())  %>' />
                                <%# Eval("Title")%>

                            </label>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

        </ul>
    </div>
    <div class="facet">
        <h5>Tình trạng việc làm</h5>
        <ul>
            <li>
                <div class="custom-control custom-radio" onchange='SerchToUrl("job","1")'>
                    <input type="radio" class="custom-control-input" id='job1' name="check" <%# CheckedLeft("job".ToSafetyString(),1) %>>
                    <label class="custom-control-label rd-red" for="job1">Đã có việc làm</label>
                </div>
            </li>
            <li>
                  <div class="custom-control custom-radio" onchange='SerchToUrl("job","2")'>
                    <input type="radio" class="custom-control-input" id='job2' name="check" <%# CheckedLeft("job".ToSafetyString(),2) %>>

                    <label class="custom-control-label rd-red" for="job2">  Chưa có việc làm</label>
                </div>
            </li>
        </ul>
    </div>
</div>

