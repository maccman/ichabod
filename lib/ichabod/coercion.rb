# Help convert objects WebKit's JS returns into things we can use

class NSCFNumber
  def inspect
    if Integer(self) == Float(self)
      Integer(self).to_s
    else
      Float(self).to_s
    end
  end
end

class NSCFBoolean
  def inspect
    (self == NSNumber.numberWithBool(true)).to_s
  end
end

class WebScriptObject
  def inspect
    callWebScriptMethod("toString", withArguments:nil)
  end
end

class WebUndefined
  def &(ob)
    false
  end
  
  def ^(ob)
    !ob
  end
  
  def inspect
    'undefined'
  end
  
  def nil?
    true
  end
  
  def to_i
    0
  end
  
  def to_f
    0.0
  end
  
  def to_a
    []
  end
  
  def to_s
    ''
  end
  
  def |(ob)
    false
  end
end