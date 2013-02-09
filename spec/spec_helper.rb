def require_model_for(spec)
  unless $LOAD_PATH.include?('app/models')
    $LOAD_PATH.unshift('app/models')
  end

  if m = /models\/(?<model>.*)_spec.rb/.match(spec)
    require m[:model]
  end
end
