### Context
- 📚 Contexts are akin to functional buckets with added capabilities for managing timeouts, cancellations, and key-value pairs.
- ⚙️ Contexts are vital for propagating information between layers of an application, enabling monitoring and error handling.
- ⏱️ Time-sensitive applications benefit from context timeouts, ensuring responses within specified timeframes.
- 🚫 Context cancellation prevents resource waste and safeguards against server overload.
- 🧩 Contexts should be used selectively for relevant information, not as a catch-all container.
- 🕒 Demonstrations involve creating, enriching, and using contexts for function execution and timeout control.
- 💡 Understanding the context's `Done` channel helps manage cancellations and timeouts effectively.
- ❗️ The `error` function in context reveals whether the context was cancelled.