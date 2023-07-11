import React from "react";
import ReactDOM from "react-dom";


class PortfolioApp extends React.Component {
  render() {
    return <p>PortfolioApp</p>;
  }
}

document.addEventListener("turbolinks:load", () => {
  const app = document.getElementById("portfolio-app");
  app && ReactDOM.render(<PortfolioApp />, app);
});

export default PortfolioApp;