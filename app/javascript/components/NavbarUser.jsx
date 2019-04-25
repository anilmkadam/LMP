import React from "react";
import NavbarLink from "./NavbarLink";

class NavbarUser extends React.Component {
  render() {
    return (
      <div>
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
          <a className="navbar-brand" href="/">
            <img src={this.props.logoUrl} width="130px" alt="logo" />
          </a>
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon" />
          </button>

          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav">
              <li className="nav-item active">
                <a className="nav-link" href="/">
                  <i className="fa fa-home" aria-hidden="true" />
                </a>
              </li>
              <li className="nav-item dropdown active">
                <a
                  className="nav-link dropdown-toggle"
                  href="#"
                  id="navbarDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i className="fa fa-user-circle fa-1g" aria-hidden="true" />
                  &nbsp;{this.props.user}
                </a>
                <div className="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a className="dropdown-item" href="/leave">
                    Apply For Leave
                  </a>
                  <a className="dropdown-item" href="/leave/history">
                    Your Leave
                  </a>
                  <a className="dropdown-item" href="/users/edit">
                    Update Profile
                  </a>
                  <div className="dropdown-divider" />
                  <a
                    className="dropdown-item btn btn-danger"
                    data-method="delete"
                    href="/users/sign_out"
                  >
                    <i className="fa fa-sign-out" aria-hidden="true" />
                    &nbsp; Logout
                  </a>
                </div>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    );
  }
}

export default NavbarUser;
