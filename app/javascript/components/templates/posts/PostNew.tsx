import React, { useState } from "react";
// import { Input } from '@chakra-ui/react'

function PostAll(props) {
  const [name, setName] = useState("");

  const handleSubmit = (evt) => {
    evt.preventDefault();
    alert(`Submitting Name ${name}`);
  };
  return (
    <React.Fragment>
      <div>投稿フォーム</div>
      <form onSubmit={handleSubmit}>
        <label>
          Frirst Name:
          <input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </label>
        <input type="submit" value="Submit" />
      </form>
    </React.Fragment>
  );
}

export default PostAll;
