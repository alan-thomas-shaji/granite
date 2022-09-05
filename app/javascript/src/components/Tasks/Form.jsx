import React from "react";

import Button from "components/Button";
import Input from "components/Input";

const Form = ({ type = "create", body, setBody, loading, handleSubmit }) => (
  <form className="mx-auto max-w-lg" onSubmit={handleSubmit}>
    <Input
      label="body"
      placeholder="Todo body (Max 50 Characters Allowed)"
      value={body}
      onChange={e => setBody(e.target.value.slice(0, 50))}
    />
    <Button
      buttonText={type === "create" ? "Create Task" : "Update Task"}
      loading={loading}
      type="submit"
    />
  </form>
);

export default Form;
