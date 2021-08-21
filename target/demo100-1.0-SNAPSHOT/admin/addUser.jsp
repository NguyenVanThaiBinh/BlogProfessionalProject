

    <tr id="tr-${user.id}">

        <td>${user.id}</td>

        <td>${user.name}</td>

        <td>${user.email}</td>

        <td>${user.user}</td>
        <td>
            <button class="btn btn-primary" value="${user.id}" onclick="myFunction(this.value)">
                Delete
            </button>
        </td>
        <td>
            <button class="btn btn-primary" value="${user.id}" onclick="editUser(this.value)">
                Edit
            </button>
        </td>


    </tr>


