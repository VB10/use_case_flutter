// Autogenerated from Pigeon (v4.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.example.use_case_flutter;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/**Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class native_cache_bridge {

  public enum Results {
    SUCCESS(0),
    FAIL(1);

    private int index;
    private Results(final int index) {
      this.index = index;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class Value {
    private @Nullable Long number;
    public @Nullable Long getNumber() { return number; }
    public void setNumber(@Nullable Long setterArg) {
      this.number = setterArg;
    }

    public static final class Builder {
      private @Nullable Long number;
      public @NonNull Builder setNumber(@Nullable Long setterArg) {
        this.number = setterArg;
        return this;
      }
      public @NonNull Value build() {
        Value pigeonReturn = new Value();
        pigeonReturn.setNumber(number);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("number", number);
      return toMapResult;
    }
    static @NonNull Value fromMap(@NonNull Map<String, Object> map) {
      Value pigeonResult = new Value();
      Object number = map.get("number");
      pigeonResult.setNumber((number == null) ? null : ((number instanceof Integer) ? (Integer)number : (Long)number));
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ResultModel {
    private @Nullable Results result;
    public @Nullable Results getResult() { return result; }
    public void setResult(@Nullable Results setterArg) {
      this.result = setterArg;
    }

    private @Nullable String token;
    public @Nullable String getToken() { return token; }
    public void setToken(@Nullable String setterArg) {
      this.token = setterArg;
    }

    public static final class Builder {
      private @Nullable Results result;
      public @NonNull Builder setResult(@Nullable Results setterArg) {
        this.result = setterArg;
        return this;
      }
      private @Nullable String token;
      public @NonNull Builder setToken(@Nullable String setterArg) {
        this.token = setterArg;
        return this;
      }
      public @NonNull ResultModel build() {
        ResultModel pigeonReturn = new ResultModel();
        pigeonReturn.setResult(result);
        pigeonReturn.setToken(token);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("result", result == null ? null : result.index);
      toMapResult.put("token", token);
      return toMapResult;
    }
    static @NonNull ResultModel fromMap(@NonNull Map<String, Object> map) {
      ResultModel pigeonResult = new ResultModel();
      Object result = map.get("result");
      pigeonResult.setResult(result == null ? null : Results.values()[(int)result]);
      Object token = map.get("token");
      pigeonResult.setToken((String)token);
      return pigeonResult;
    }
  }

  public interface Result<T> {
    void success(T result);
    void error(Throwable error);
  }
  private static class Api2HostCodec extends StandardMessageCodec {
    public static final Api2HostCodec INSTANCE = new Api2HostCodec();
    private Api2HostCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return ResultModel.fromMap((Map<String, Object>) readValue(buffer));
        
        case (byte)129:         
          return Value.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof ResultModel) {
        stream.write(128);
        writeValue(stream, ((ResultModel) value).toMap());
      } else 
      if (value instanceof Value) {
        stream.write(129);
        writeValue(stream, ((Value) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter. */
  public interface Api2Host {
    void calculate(@NonNull Value value, Result<Value> result);
    @NonNull ResultModel tokenParse(@NonNull String id);

    /** The codec used by Api2Host. */
    static MessageCodec<Object> getCodec() {
      return Api2HostCodec.INSTANCE;
    }

    /**Sets up an instance of `Api2Host` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, Api2Host api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.Api2Host.calculate", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              Value valueArg = (Value)args.get(0);
              if (valueArg == null) {
                throw new NullPointerException("valueArg unexpectedly null.");
              }
              Result<Value> resultCallback = new Result<Value>() {
                public void success(Value result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.calculate(valueArg, resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.Api2Host.tokenParse", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              String idArg = (String)args.get(0);
              if (idArg == null) {
                throw new NullPointerException("idArg unexpectedly null.");
              }
              ResultModel output = api.tokenParse(idArg);
              wrapped.put("result", output);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorMap;
  }
}
