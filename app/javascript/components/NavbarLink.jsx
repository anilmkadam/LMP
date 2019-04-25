import React from "react";

// class NavbarLink extends React.Component {
//   render() {
//     return (
//       <li className="nav-item active">
//         <a className="nav-link" href="#">
//           {this.props.linkText}
//         </a>
//       </li>
//     );
//   }
// }

class NavbarLink extends React.Component {
  render() {
    var links = ["Home", "Add User", "Apply For Leave"];
    var id = 1;
    const NavLinks = links.map(link => {
      return (
        <li className="nav-item active" key={id++}>
          <a className="nav-link" href="#">
            {link}
          </a>
        </li>
      );
    });
    return (
      <ul className="navbar-nav mr-auto">
        {NavLinks}
        <li className="nav-item active">
          <a
            className="nav-link btn btn-danger"
            data-method="delete"
            href="/users/sign_out"
          >
            Logout
          </a>
        </li>
      </ul>
    );
  }
}

export default NavbarLink;
